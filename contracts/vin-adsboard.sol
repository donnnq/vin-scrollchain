// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ScrollAdsBoard {
    struct Ad {
        string title;
        string message;
        string link;
        address creator;
        uint256 timestamp;
    }

    Ad[] public ads;
    address public admin;

    event AdPosted(string title, address indexed creator);
    event AdRemoved(uint256 index, address indexed remover);

    constructor() {
        admin = msg.sender;
    }

    function postAd(string calldata title, string calldata message, string calldata link) external {
        ads.push(Ad(title, message, link, msg.sender, block.timestamp));
        emit AdPosted(title, msg.sender);
    }

    function getAd(uint256 index) external view returns (string memory, string memory, string memory, address, uint256) {
        Ad memory a = ads[index];
        return (a.title, a.message, a.link, a.creator, a.timestamp);
    }

    function removeAd(uint256 index) external {
        require(msg.sender == admin, "Only admin can remove ads");
        require(index < ads.length, "Invalid index");

        for (uint256 i = index; i < ads.length - 1; i++) {
            ads[i] = ads[i + 1];
        }
        ads.pop();

        emit AdRemoved(index, msg.sender);
    }

    function totalAds() external view returns (uint256) {
        return ads.length;
    }
}
