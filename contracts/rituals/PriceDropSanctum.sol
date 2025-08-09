// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title PriceDropSanctum - Ritual scroll to reduce cost of living and restore dignity
/// @author Vinvin
/// @notice Drops prices of essentials and emits civic relief events

contract PriceDropSanctum {
    mapping(string => uint256) public itemPrice;
    event PriceDropped(string item, uint256 newPrice);

    constructor() {
        itemPrice["rice"] = 50;
        itemPrice["water"] = 10;
        itemPrice["electricity"] = 100;
        itemPrice["transport"] = 25;
        itemPrice["medicine"] = 30;
    }

    /// @notice Drop price of an item
    function dropPrice(string calldata item, uint256 newPrice) external {
        itemPrice[item] = newPrice;
        emit PriceDropped(item, newPrice);
    }

    /// @notice View current price
    function getPrice(string calldata item) external view returns (uint256) {
        return itemPrice[item];
    }
}
