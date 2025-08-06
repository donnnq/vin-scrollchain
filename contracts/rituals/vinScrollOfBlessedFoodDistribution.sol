// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinScrollOfBlessedFoodDistribution {
    address public sovereignCouncil;

    struct DistributionZone {
        string name;
        string country;
        bool isDignityAligned;
    }

    struct FoodDelivery {
        string cropType;
        uint quantity;
        uint zoneId;
        string ancestralGlyph;
        string civicSigil;
        bool delivered;
    }

    DistributionZone[] public zones;
    FoodDelivery[] public deliveries;

    event ZoneRegistered(uint indexed zoneId, string name, string country);
    event DeliveryPrepared(uint indexed deliveryId, string cropType, uint quantity);
    event DeliveryCompleted(uint indexed deliveryId, string glyph, string sigil);

    modifier onlyCouncil() {
        require(msg.sender == sovereignCouncil, "Unauthorized");
        _;
    }

    constructor(address _sovereignCouncil) {
        sovereignCouncil = _sovereignCouncil;
    }

    function registerZone(string memory name, string memory country, bool isDignityAligned) public onlyCouncil {
        zones.push(DistributionZone({
            name: name,
            country: country,
            isDignityAligned: isDignityAligned
        }));
        emit ZoneRegistered(zones.length - 1, name, country);
    }

    function prepareDelivery(
        string memory cropType,
        uint quantity,
        uint zoneId,
        string memory ancestralGlyph,
        string memory civicSigil
    ) public onlyCouncil {
        require(zones[zoneId].isDignityAligned, "Zone not dignity-aligned");

        deliveries.push(FoodDelivery({
            cropType: cropType,
            quantity: quantity,
            zoneId: zoneId,
            ancestralGlyph: ancestralGlyph,
            civicSigil: civicSigil,
            delivered: false
        }));

        emit DeliveryPrepared(deliveries.length - 1, cropType, quantity);
    }

    function completeDelivery(uint deliveryId) public onlyCouncil {
        require(!deliveries[deliveryId].delivered, "Already delivered");
        deliveries[deliveryId].delivered = true;
        emit DeliveryCompleted(
            deliveryId,
            deliveries[deliveryId].ancestralGlyph,
            deliveries[deliveryId].civicSigil
        );
    }
}
