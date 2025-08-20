// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract WitnessProtection {
    address public steward;

    struct Shield {
        address witness;
        string protectionType;
        string duration;
        string assignedAgency;
        bool active;
    }

    mapping(address => Shield) public shields;

    modifier onlySteward() {
        require(msg.sender == steward, "Only steward can assign");
        _;
    }

    function assignShield(
        address _witness,
        string memory _protectionType,
        string memory _duration,
        string memory _assignedAgency
    ) public onlySteward {
        shields[_witness] = Shield(_witness, _protectionType, _duration, _assignedAgency, true);
    }

    function deactivateShield(address _witness) public onlySteward {
        shields[_witness].active = false;
    }

    function getShieldStatus(address _witness) public view returns (Shield memory) {
        return shields[_witness];
    }
}
