// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVinScrollforge {
    function isSoulbound(uint256 id) external view returns (bool);
    function safeTransferFrom(address from, address to, uint256 id, uint256 amount, bytes calldata data) external;
}

contract VinScrollMarket {
    struct Offer {
        address owner;
        uint256 scrollId;
        uint256 amount;
        string message;
        bool active;
    }

    IVinScrollforge public scrollforge;
    Offer[] public offers;

    event ScrollOffered(uint256 indexed offerId, address indexed owner, uint256 scrollId, uint256 amount, string message);
    event ScrollClaimed(uint256 indexed offerId, address indexed claimer);

    constructor(address _scrollforge) {
        scrollforge = IVinScrollforge(_scrollforge);
    }

    function offerScroll(uint256 scrollId, uint256 amount, string calldata message) external {
        require(!scrollforge.isSoulbound(scrollId), "Cannot offer soulbound scrolls");

        scrollforge.safeTransferFrom(msg.sender, address(this), scrollId, amount, "");

        offers.push(Offer({
            owner: msg.sender,
            scrollId: scrollId,
            amount: amount,
            message: message,
            active: true
        }));

        emit ScrollOffered(offers.length - 1, msg.sender, scrollId, amount, message);
    }

    function claimScroll(uint256 offerId) external {
        Offer storage o = offers[offerId];
        require(o.active, "Offer inactive");
        o.active = false;

        scrollforge.safeTransferFrom(address(this), msg.sender, o.scrollId, o.amount, "");

        emit ScrollClaimed(offerId, msg.sender);
    }

    function
