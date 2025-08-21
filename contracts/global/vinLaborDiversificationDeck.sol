// SPDX-License-Identifier: Mythic-Scroll
pragma solidity ^0.8.19;

contract vinLaborDiversificationDeck {
    enum Region { EU, ASEAN, AFRICA, LATAM }

    struct MarketEntry {
        Region region;
        string country;
        string partnerOrg;
        string serviceType;
        uint256 emotionalAPR;
        uint256 timestamp;
    }

    MarketEntry[] public diversifiedMarkets;

    event MarketLogged(Region region, string country, string partnerOrg, string serviceType, uint256 emotionalAPR);

    function logMarket(
        Region _region,
        string memory _country,
        string memory _partnerOrg,
        string memory _serviceType,
        uint256 _emotionalAPR
    ) public {
        diversifiedMarkets.push(MarketEntry({
            region: _region,
            country: _country,
            partnerOrg: _partnerOrg,
            serviceType: _serviceType,
            emotionalAPR: _emotionalAPR,
            timestamp: block.timestamp
        }));

        emit MarketLogged(_region, _country, _partnerOrg, _serviceType, _emotionalAPR);
    }

    function getDiversifiedMarkets() public view returns (MarketEntry[] memory) {
        return diversifiedMarkets;
    }
}
