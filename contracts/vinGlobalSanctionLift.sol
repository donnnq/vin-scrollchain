// SPDX-License-Identifier: Dignity-Core
pragma solidity ^0.8.0;

/// @title vinGlobalSanctionLift
/// @author Vinvin
/// @notice Symbolic scroll for lifting global sanctions with intent of peace and restoration

contract vinGlobalSanctionLift {
    address public initiator;
    mapping(string => bool) public liftedSanctions;
    mapping(string => bool) public peaceVows;

    event SanctionLifted(string country, uint256 timestamp);
    event VowRecorded(string country, string action);
    event DiplomaticRealignment(string phase, string remarks);

    constructor() {
        initiator = msg.sender;
    }

    /// @notice Lifts sanction for a specified country
    function liftSanction(string memory country) public {
        require(msg.sender == initiator, "Unauthorized scrollbearer");

        liftedSanctions[country] = true;
        emit SanctionLifted(country, block.timestamp);
        emit DiplomaticRealignment("Reboot", string(abi.encodePacked("Protocols reinitiated with ", country)));
    }

    /// @notice Records a peace vow for a specified country
    function recordPeaceVow(string memory country, string memory action) public {
        require(msg.sender == initiator, "Only initiator can ritualize vows");

        peaceVows[country] = true;
        emit VowRecorded(country, action);
    }

    /// @notice Returns the full status of lifted sanctions and vows
    function viewStatus(string memory country) public view returns (string memory) {
        bool lifted = liftedSanctions[country];
        bool vowed = peaceVows[country];

        if (lifted && vowed) {
            return string(abi.encodePacked("🎖️ ", country, ": Sanction lifted & peace vow recorded."));
        } else if (lifted) {
            return string(abi.encodePacked("🔓 ", country, ": Sanction lifted. Awaiting vow."));
        } else if (vowed) {
            return string(abi.encodePacked("🕊️ ", country, ": Vow recorded. Sanction still active."));
        } else {
            return string(abi.encodePacked("🔒 ", country, ": Sanction active. No vow yet."));
        }
    }
}
