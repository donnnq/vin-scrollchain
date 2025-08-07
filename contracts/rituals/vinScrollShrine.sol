// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title vinScrollShrine — Archive of legendary roast verdicts for eternal reflection
contract vinScrollShrine {
    struct Relic {
        string title;
        string mistake;
        string correction;
        string roastLine;
        address target;
        address enshrinedBy;
        uint256 timestamp;
        uint8 severity; // 1 = Mild, 5 = Brutal
    }

    Relic[] public relics;

    event ShrineBlessed(
        string title,
        address indexed target,
        address indexed enshrinedBy,
        uint8 severity,
        string roastLine
    );

    /// @notice Enshrines a roast verdict into the shrine
    function enshrineRelic(
        string memory title,
        string memory mistake,
        string memory correction,
        string memory roastLine,
        address target,
        uint8 severity
    ) external {
        require(severity >= 1 && severity <= 5, "Severity must be 1–5");

        relics.push(Relic({
            title: title,
            mistake: mistake,
            correction: correction,
            roastLine: roastLine,
            target: target,
            enshrinedBy: msg.sender,
            timestamp: block.timestamp,
            severity: severity
        }));

        emit ShrineBlessed(title, target, msg.sender, severity, roastLine);
    }

    /// @notice Returns all relics enshrined for a specific target
    function getRelicsBy(address target) external view returns (Relic[] memory filtered) {
        uint256 count;
        for (uint i = 0; i < relics.length; i++) {
            if (relics[i].target == target) count++;
        }

        filtered = new Relic[](count);
        uint256 idx;
        for (uint i = 0; i < relics.length; i++) {
            if (relics[i].target == target) {
                filtered[idx++] = relics[i];
            }
        }
    }

    /// @notice Returns total number of relics in the shrine
    function totalRelics() external view returns (uint256) {
        return relics.length;
    }
}
