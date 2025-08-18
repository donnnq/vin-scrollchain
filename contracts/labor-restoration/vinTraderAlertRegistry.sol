// SPDX-License-Identifier: Mythic-OS
pragma solidity ^0.25.08;

contract vinTraderAlertRegistry {
    string public registryName = "Trader Alert Registry";
    string public steward = "Vinvin, Mythic Scrollsmith";
    string public activationDate = "2025-08-18";
    string public glyph = "📉🔔🧿📈";

    struct Alert {
        string alertType;
        string message;
        uint256 timestamp;
    }

    mapping(address => Alert[]) public traderAlerts;

    event AlertLogged(address indexed trader, string alertType, string message, uint256 timestamp);
    event GlobalBroadcast(string message, uint256 timestamp);

    function logAlert(string memory _alertType, string memory _message) public {
        traderAlerts[msg.sender].push(Alert({
            alertType: _alertType,
            message: _message,
            timestamp: block.timestamp
        }));

        emit AlertLogged(msg.sender, _alertType, _message, block.timestamp);
        emit GlobalBroadcast("Tremor detected. Mythic alert dispatched.", block.timestamp);
    }

    function getLatestAlert(address _trader) public view returns (string memory, string memory, uint256) {
        uint256 len = traderAlerts[_trader].length;
        require(len > 0, "No alerts logged yet.");
        Alert memory alert = traderAlerts[_trader][len - 1];
        return (alert.alertType, alert.message, alert.timestamp);
    }

    function registryWisdom() public pure returns (string memory) {
        return "When tremors rise, alert the stewards. When hype blinds, signal the mythic path.";
    }
}
