// SPDX-License-Identifier: VINVIN-GovSanctify-v1
pragma solidity ^0.8.24;

/// @title vinGlobalLedgerOfSanctifiedGovernance
/// @notice Tracks nations with scrollkeeper-certified governance integrity
contract vinGlobalLedgerOfSanctifiedGovernance {
    address public scrollkeeper;

    struct SanctifiedNation {
        string name;
        uint8 integrityScore; // 0–100
        bool scrollkeeperCertified;
        string emojiSeal;
        uint256 timestamp;
    }

    mapping(string => SanctifiedNation) public sanctifiedLog;
    string[] public certifiedNations;

    event NationSanctified(string indexed name, uint8 score, string emoji);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function certifyNation(
        string calldata name,
        uint8 score,
        string calldata emoji
    ) external {
        require(msg.sender == scrollkeeper, "Only VINVIN may sanctify nations");
        sanctifiedLog[name] = SanctifiedNation(name, score, true, emoji, block.timestamp);
        certifiedNations.push(name);
        emit NationSanctified(name, score, emoji);
    }

    function viewSanctifiedNation(string calldata name) external view returns (
        uint8 score,
        bool certified,
        string memory emoji,
        uint256 time
    ) {
        SanctifiedNation memory n = sanctifiedLog[name];
        return (n.integrityScore, n.scrollkeeperCertified, n.emojiSeal, n.timestamp);
    }

    function allCertifiedNations() external view returns (string[] memory) {
        return certifiedNations;
    }
}
