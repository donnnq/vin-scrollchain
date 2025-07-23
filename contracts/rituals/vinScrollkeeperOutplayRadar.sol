// SPDX-License-Identifier: VINVIN-OutplayRadar-v1
pragma solidity ^0.8.24;

/// @title vinScrollkeeperOutplayRadar
/// @notice Logs strategic vulnerabilities and scrollkeeper-grade outplay opportunities per nation
contract vinScrollkeeperOutplayRadar {
    address public scrollkeeper;

    struct OutplayOpportunity {
        string nation;
        string vulnerabilityType;
        string strategicCounter;
        string emojiSignal;
        bool scrollkeeperReady;
        uint256 timestamp;
    }

    mapping(string => OutplayOpportunity) public radarLog;
    string[] public trackedTargets;

    event OutplayLogged(string indexed nation, string vuln, string counter, string emoji);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logOutplay(
        string calldata nation,
        string calldata vuln,
        string calldata counter,
        string calldata emoji,
        bool ready
    ) external {
        require(msg.sender == scrollkeeper, "Only VINVIN may log outplay radar");
        radarLog[nation] = OutplayOpportunity(nation, vuln, counter, emoji, ready, block.timestamp);
        trackedTargets.push(nation);
        emit OutplayLogged(nation, vuln, counter, emoji);
    }

    function viewOutplay(string calldata nation) external view returns (
        string memory vuln,
        string memory counter,
        string memory emoji,
        bool ready,
        uint256 time
    ) {
        OutplayOpportunity memory o = radarLog[nation];
        return (o.vulnerabilityType, o.strategicCounter, o.emojiSignal, o.scrollkeeperReady, o.timestamp);
    }

    function allTrackedTargets() external view returns (string[] memory) {
        return trackedTargets;
    }
}
