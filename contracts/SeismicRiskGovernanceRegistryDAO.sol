// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SeismicRiskGovernanceRegistryDAO {
    address public steward;

    struct RiskEntry {
        string region;
        string faultLine;
        string riskLevel; // "Low", "Moderate", "High", "Critical"
        string governanceAction; // "Evacuation", "Shutdown", "Audit", "Monitoring"
        string emotionalTag;
        uint256 timestamp;
    }

    RiskEntry[] public entries;

    event RiskLogged(
        string region,
        string faultLine,
        string riskLevel,
        string governanceAction,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log seismic governance rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logRisk(
        string memory region,
        string memory faultLine,
        string memory riskLevel,
        string memory governanceAction,
        string memory emotionalTag
    ) external onlySteward {
        entries.push(RiskEntry({
            region: region,
            faultLine: faultLine,
            riskLevel: riskLevel,
            governanceAction: governanceAction,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit RiskLogged(region, faultLine, riskLevel, governanceAction, emotionalTag, block.timestamp);
    }

    function getRiskByIndex(uint256 index) external view returns (
        string memory region,
        string memory faultLine,
        string memory riskLevel,
        string memory governanceAction,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < entries.length, "Scrollstorm index out of bounds");
        RiskEntry memory r = entries[index];
        return (
            r.region,
            r.faultLine,
            r.riskLevel,
            r.governanceAction,
            r.emotionalTag,
            r.timestamp
        );
    }
}
