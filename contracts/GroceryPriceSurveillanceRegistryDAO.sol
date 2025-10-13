// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GroceryPriceSurveillanceRegistryDAO {
    address public steward;

    struct PriceEvent {
        string productName;
        string storeName;
        uint256 priceInCents;
        string priceTagType; // "Inflated", "Fair", "Subsidized"
        string emotionalTag;
        uint256 timestamp;
    }

    PriceEvent[] public events;

    event PriceLogged(
        string productName,
        string storeName,
        uint256 priceInCents,
        string priceTagType,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log grocery price rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logPrice(
        string memory productName,
        string memory storeName,
        uint256 priceInCents,
        string memory priceTagType,
        string memory emotionalTag
    ) external onlySteward {
        events.push(PriceEvent({
            productName: productName,
            storeName: storeName,
            priceInCents: priceInCents,
            priceTagType: priceTagType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit PriceLogged(productName, storeName, priceInCents, priceTagType, emotionalTag, block.timestamp);
    }

    function getPriceByIndex(uint256 index) external view returns (
        string memory productName,
        string memory storeName,
        uint256 priceInCents,
        string memory priceTagType,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        PriceEvent memory p = events[index];
        return (
            p.productName,
            p.storeName,
            p.priceInCents,
            p.priceTagType,
            p.emotionalTag,
            p.timestamp
        );
    }
}
