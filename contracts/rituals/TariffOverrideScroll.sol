// SPDX-License-Identifier: Scrollsmith-Override
pragma solidity ^0.8.0;

contract TariffOverrideScroll {
    address public steward;
    uint256 public overrideRate = 5; // Flat 5% tariff
    mapping(string => bool) public overrideActivated;

    event TariffOverridden(string indexed country, uint256 newRate, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function activateOverride(string memory country) external onlySteward {
        overrideActivated[country] = true;
        emit TariffOverridden(country, overrideRate, block.timestamp);
    }

    function getTariff(string memory country) external view returns (uint256) {
        return overrideActivated[country] ? overrideRate : 0;
    }

    function updateSteward(address newSteward) external onlySteward {
        steward = newSteward;
    }

    function updateOverrideRate(uint256 newRate) external onlySteward {
        require(newRate <= 10, "Override too high");
        overrideRate = newRate;
    }
}
