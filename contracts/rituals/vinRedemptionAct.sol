// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinRedemptionAct {
    event RedemptionLogged(address indexed official, string role, string statement, uint256 timestamp);

    struct RedemptionProfile {
        bool hasAdmitted;
        bool hasChanged;
        bool acceptedByCouncil;
        string newRole;
    }

    mapping(address => RedemptionProfile) public profiles;
    address public scrollCouncil;

    modifier onlyCouncil() {
        require(msg.sender == scrollCouncil, "Scroll access denied.");
        _;
    }

    constructor() {
        scrollCouncil = msg.sender; // VINVIN or DAO ops
    }

    function submitRedemption(
        address official,
        string memory role,
        string memory statement
    ) public onlyCouncil {
        profiles[official].hasAdmitted = true;
        profiles[official].hasChanged = true;
        profiles[official].acceptedByCouncil = true;
        profiles[official].newRole = role;

        emit RedemptionLogged(official, role, statement, block.timestamp);
    }

    function verifyRedemption(address official) public view returns (string memory status) {
        RedemptionProfile memory p = profiles[official];
        if (p.hasAdmitted && p.hasChanged && p.acceptedByCouncil) {
            return string(abi.encodePacked("Approved for VINVIN World Re-entry as ", p.newRole));
        } else {
            return "Redemption not yet verified.";
        }
    }
}
