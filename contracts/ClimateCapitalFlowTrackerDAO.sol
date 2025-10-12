// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title ClimateCapitalFlowTrackerDAO
 * @dev Emotionally tagged smart contract to log climate-aligned capital flows,
 * divestment signals, and ESG migration — scrollchain-sealed consequence.
 */

contract ClimateCapitalFlowTrackerDAO {
    address public steward;

    struct CapitalFlow {
        address initiator;
        string institution;
        string flowType; // e.g. "Divestment", "Green Allocation", "Exit Alliance"
        string emotionalTag;
        uint256 timestamp;
    }

    CapitalFlow[] public flows;

    event ClimateCapitalFlowLogged(address indexed initiator, string institution, string flowType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log climate capital flows");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logFlow(address initiator, string memory institution, string memory flowType, string memory emotionalTag) external onlySteward {
        flows.push(CapitalFlow({
            initiator: initiator,
            institution: institution,
            flowType: flowType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit ClimateCapitalFlowLogged(initiator, institution, flowType, emotionalTag, block.timestamp);
    }

    function getFlowByIndex(uint256 index) external view returns (address initiator, string memory institution, string memory flowType, string memory emotionalTag, uint256 timestamp) {
        require(index < flows.length, "Scrollstorm index out of bounds");
        CapitalFlow memory f = flows[index];
        return (f.initiator, f.institution, f.flowType, f.emotionalTag, f.timestamp);
    }
}
