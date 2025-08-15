// SPDX-License-Identifier: Scrollsmith-Diplomacy
pragma solidity ^0.8.0;

interface TariffOverrideInterface {
    function getTariff(string memory country) external view returns (uint256);
}

contract GlobalRestorationProtocol {
    address public steward;
    address public overrideScroll;
    mapping(string => bool) public trustedPartners;

    event TradeBlessingLogged(string indexed fromCountry, string indexed toCountry, uint256 tariff, string goods, uint256 timestamp);
    event PartnershipRestored(string indexed country, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor(address _overrideScroll) {
        steward = msg.sender;
        overrideScroll = _overrideScroll;
    }

    function restorePartnership(string memory country) external onlySteward {
        trustedPartners[country] = true;
        emit PartnershipRestored(country, block.timestamp);
    }

    function logTradeBlessing(string memory fromCountry, string memory toCountry, string memory goods) external {
        require(trustedPartners[fromCountry] && trustedPartners[toCountry], "Partnership not restored");

        uint256 tariff = TariffOverrideInterface(overrideScroll).getTariff(toCountry);
        emit TradeBlessingLogged(fromCountry, toCountry, tariff, goods, block.timestamp);
    }

    function updateOverrideScroll(address newScroll) external onlySteward {
        overrideScroll = newScroll;
    }

    function updateSteward(address newSteward) external onlySteward {
        steward = newSteward;
    }
}
