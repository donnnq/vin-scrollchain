// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinSRPPriceRedemption {
    address public steward;
    mapping(string => uint256) public srpPrice;
    mapping(string => bool) public essentialItem;

    event PriceFixed(string item, uint256 newPrice, bool isEssential);

    constructor() {
        steward = msg.sender;
    }

    function setSRP(string memory item, uint256 price, bool isEssential) public {
        require(msg.sender == steward, "Only steward can set SRP");
        srpPrice[item] = price;
        essentialItem[item] = isEssential;
        emit PriceFixed(item, price, isEssential);
    }

    function getSRP(string memory item) public view returns (uint256) {
        return srpPrice[item];
    }

    function isItemEssential(string memory item) public view returns (bool) {
        return essentialItem[item];
    }
}
