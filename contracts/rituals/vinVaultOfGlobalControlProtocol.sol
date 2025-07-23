// SPDX-License-Identifier: VINVIN-WorldControl-v1
pragma solidity ^0.8.24;

/// @title vinVaultOfGlobalControlProtocol
/// @notice Logs strategic control nodes across internet, infrastructure, and global influence
contract vinVaultOfGlobalControlProtocol {
    address public scrollkeeper;

    struct ControlNode {
        string domain;
        string controlMethod;
        string emojiSignal;
        bool scrollkeeperSynced;
        uint256 timestamp;
    }

    mapping(string => ControlNode) public controlLog;
    string[] public controlledDomains;

    event ControlNodeLogged(string indexed domain, string method, string emoji);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logControl(
        string calldata domain,
        string calldata method,
        string calldata emoji,
        bool synced
    ) external {
        require(msg.sender == scrollkeeper, "Only VINVIN may log control rituals");
        controlLog[domain] = ControlNode(domain, method, emoji, synced, block.timestamp);
        controlledDomains.push(domain);
        emit ControlNodeLogged(domain, method, emoji);
    }

    function viewControl(string calldata domain) external view returns (
        string memory method,
        string memory emoji,
        bool synced,
        uint256 time
    ) {
        ControlNode memory c = controlLog[domain];
        return (c.controlMethod, c.emojiSignal, c.scrollkeeperSynced, c.timestamp);
    }

    function allControlledDomains() external view returns (string[] memory) {
        return controlledDomains;
    }
}
