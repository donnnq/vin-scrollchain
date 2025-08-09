// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title MatampuhinOracle - Ritual module that detects envy signals and counters with civic lambing upgrades
/// @author Vinvin
/// @notice Listens for matampuhin keywords and emits lambing triggers for barangay healing

contract MatampuhinOracle {
    address public scrollsmith;

    struct Signal {
        string barangay;
        string message;
        uint256 timestamp;
        bool lambingTriggered;
    }

    Signal[] public signals;
    mapping(string => uint256) public lastLambing;

    uint256 public cooldown = 1 days;
    string[] public envyKeywords = ["bakit sila", "kami wala", "papakulong na lang", "sila may aircon"];

    event EnvySignalDetected(string indexed barangay, string message);
    event LambingTriggered(string indexed barangay, string ritualMessage);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not scrollsmith");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Submit a public message for oracle analysis
    function submitSignal(string calldata barangay, string calldata message) external {
        bool isEnvy = false;

        for (uint256 i = 0; i < envyKeywords.length; i++) {
            if (_contains(message, envyKeywords[i])) {
                isEnvy = true;
                break;
            }
        }

        signals.push(Signal(barangay, message, block.timestamp, false));

        if (isEnvy && block.timestamp > lastLambing[barangay] + cooldown) {
            emit EnvySignalDetected(barangay, message);

            string memory ritualMessage = string(abi.encodePacked(
                "Barangay ", barangay, " feels matampuhin. Initiating Lambing Ritual: free SoulFuel, hugs, and civic upgrades."
            ));

            emit LambingTriggered(barangay, ritualMessage);
            lastLambing[barangay] = block.timestamp;

            signals[signals.length - 1].lambingTriggered = true;
        }
    }

    /// @notice Update envy keywords
    function updateKeywords(string[] calldata newKeywords) external onlyScrollsmith {
        envyKeywords = newKeywords;
    }

    /// @notice Update cooldown period
    function setCooldown(uint256 newCooldown) external onlyScrollsmith {
        cooldown = newCooldown;
    }

    /// @dev Internal string match (naive)
    function _contains(string memory haystack, string memory needle) internal pure returns (bool) {
        bytes memory h = bytes(haystack);
        bytes memory n = bytes(needle);
        if (n.length > h.length) return false;

        for (uint256 i = 0; i <= h.length - n.length; i++) {
            bool match = true;
            for (uint256 j = 0; j < n.length; j++) {
                if (h[i + j] != n[j]) {
                    match = false;
                    break;
                }
            }
            if (match) return true;
        }
        return false;
    }
}
