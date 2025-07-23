// SPDX-License-Identifier: VINVIN-PortBuyoutPlanB-v1
pragma solidity ^0.8.24;

/// @title vinPlanBPortAcquisitionProtocol
/// @notice Logs strategic port acquisition intents and scrollkeeper-grade buyout rituals
contract vinPlanBPortAcquisitionProtocol {
    address public scrollkeeper;

    struct PortBuyout {
        string portName;
        string region;
        uint256 estimatedValueUSD;
        string strategicPurpose;
        bool acquisitionIntent;
        uint256 timestamp;
    }

    mapping(string => PortBuyout) public buyoutLog;
    string[] public targetedPorts;

    event PortTargeted(string indexed portName, string region, uint256 value, string purpose);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logBuyoutIntent(
        string calldata portName,
        string calldata region,
        uint256 value,
        string calldata purpose,
        bool intent
    ) external {
        require(msg.sender == scrollkeeper, "Only VINVIN may initiate port buyout rituals");
        buyoutLog[portName] = PortBuyout(portName, region, value, purpose, intent, block.timestamp);
        targetedPorts.push(portName);
        emit PortTargeted(portName, region, value, purpose);
    }

    function viewBuyout(string calldata portName) external view returns (
        string memory region,
        uint256 value,
        string memory purpose,
        bool intent,
        uint256 time
    ) {
        PortBuyout memory p = buyoutLog[portName];
        return (p.region, p.estimatedValueUSD, p.strategicPurpose, p.acquisitionIntent, p.timestamp);
    }

    function allTargetedPorts() external view returns (string[] memory) {
        return targetedPorts;
    }
}
