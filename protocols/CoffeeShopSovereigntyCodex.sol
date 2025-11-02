// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CoffeeShopSovereigntyCodex {
    address public steward;

    struct ShopClause {
        string parkName;
        string shopType;
        string sovereigntyStatus;
        string emotionalTag;
    }

    ShopClause[] public codex;

    event ShopLogged(string parkName, string shopType, string sovereigntyStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function logShop(
        string memory parkName,
        string memory shopType,
        string memory sovereigntyStatus,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ShopClause(parkName, shopType, sovereigntyStatus, emotionalTag));
        emit ShopLogged(parkName, shopType, sovereigntyStatus, emotionalTag);
    }
}
