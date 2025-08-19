// SPDX-License-Identifier: Civic-Justice-License
pragma solidity ^0.8.0;

contract vinYouthAccountabilityCovenant {
    struct Minor {
        string name;
        uint8 age;
        uint8 violationCount;
        bool isFlagged;
    }

    struct Guardian {
        string name;
        string relationship;
        bool isAccountable;
        uint256 totalFines;
    }

    mapping(address => Minor) public minors;
    mapping(address => Guardian) public guardians;

    event ViolationLogged(address indexed minor, uint8 violationCount);
    event GuardianFlagged(address indexed guardian, uint256 totalFines);
    event MinorSurrendered(address indexed minor, string note);

    function logViolation(address _minor, string memory _name, uint8 _age) public {
        minors[_minor].name = _name;
        minors[_minor].age = _age;
        minors[_minor].violationCount += 1;

        if (minors[_minor].violationCount >= 3) {
            minors[_minor].isFlagged = true;
        }

        emit ViolationLogged(_minor, minors[_minor].violationCount);
    }

    function linkGuardian(address _guardian, string memory _name, string memory _relationship) public {
        guardians[_guardian].name = _name;
        guardians[_guardian].relationship = _relationship;
        guardians[_guardian].isAccountable = true;
    }

    function applyFine(address _guardian, uint256 _amount) public {
        require(guardians[_guardian].isAccountable, "Guardian not linked");
        guardians[_guardian].totalFines += _amount;

        emit GuardianFlagged(_guardian, guardians[_guardian].totalFines);
    }

    function surrenderMinor(address _minor, string memory _note) public {
        require(minors[_minor].isFlagged, "Minor not eligible for surrender");
        emit MinorSurrendered(_minor, _note);
    }

    function covenantWisdom() public pure returns (string memory) {
        return "When a child strays, the village must guide. Accountability is not punishment—it is restoration.";
    }
}
