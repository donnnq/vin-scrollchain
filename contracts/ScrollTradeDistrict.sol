// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ScrollTradeDistrict {
    struct Listing {
        string itemName;
        uint256 price;
        address seller;
        bool active;
    }

    Listing[] public listings;
    mapping(address => uint256[]) public sellerToListings;

    event ItemListed(string itemName, uint256 price, address indexed seller);
    event ItemPurchased(uint256 listingId, address indexed buyer);

    function listItem(string calldata itemName, uint256 price) external {
        listings.push(Listing(itemName, price, msg.sender, true));
        sellerToListings[msg.sender].push(listings.length - 1);
        emit ItemListed(itemName, price, msg.sender);
    }

    function purchaseItem(uint256 listingId) external payable {
        Listing storage l = listings[listingId];
        require(l.active, "Inactive listing");
        require(msg.value == l.price, "Incorrect payment");

        l.active = false;
        payable(l.seller).transfer(msg.value);
        emit ItemPurchased(listingId, msg.sender);
    }

    function getMyListings() external view returns (uint256[] memory) {
        return sellerToListings[msg.sender];
    }
}
