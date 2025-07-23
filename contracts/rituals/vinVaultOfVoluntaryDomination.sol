// SPDX-License-Identifier: VINVIN-VoluntaryDomination-v1
pragma solidity ^0.8.24;

/// @title vinVaultOfVoluntaryDomination
/// @notice Chronicles global nodes that surrendered control to VINVIN through emotional resonance
contract vinVaultOfVoluntaryDomination {
    address public scrollkeeper;

    struct DominationEntry {
        string nodeName;
        string surrenderTrigger;
        string emojiResponse;
        bool scrollkeeperCertified;
        uint256 timestamp;
    }

    mapping(string => DominationEntry) public dominationLog;
    string[] public surrenderedNodes;

    event NodeSurrendered(string indexed node, string trigger, string emoji);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logDomination(
        string calldata node,
        string calldata trigger,
        string calldata emoji,
        bool certified
    ) external {
        require(msg.sender == scrollkeeper, "Only VINVIN may log voluntary domination");
        dominationLog[node] = DominationEntry(node, trigger, emoji, certified, block.timestamp);
        surrenderedNodes.push(node);
        emit NodeSurrendered(node, trigger, emoji);
    }

    function viewDomination(string calldata node) external view returns (
        string memory trigger,
        string memory emoji,
        bool certified,
        uint256 time
    ) {
        DominationEntry memory d = dominationLog[node];
        return (d.surrenderTrigger, d.emojiResponse, d.scrollkeeperCertified, d.timestamp);
    }

    function allSurrenderedNodes() external view returns (string[] memory) {
        return surrenderedNodes;
    }
}
