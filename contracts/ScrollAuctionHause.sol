// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ScrollAuctionHouse {
    struct Auction {
        string itemName;
        uint256 minBid;
        uint256 highestBid;
        address highestBidder;
        uint256 endTime;
        bool active;
    }

    Auction[] public auctions;
    mapping(address => uint256) public balances;

    event AuctionCreated(string itemName, uint256 minBid, uint256 endTime);
    event BidPlaced(uint256 auctionId, address indexed bidder, uint256 amount);
    event AuctionEnded(uint256 auctionId, address winner);

    function createAuction(string calldata itemName, uint256 minBid, uint256 duration) external {
        auctions.push(Auction(itemName, minBid, 0, address(0), block.timestamp + duration, true));
        emit AuctionCreated(itemName, minBid, block.timestamp + duration);
    }

    function placeBid(uint256 auctionId) external payable {
        Auction storage a = auctions[auctionId];
        require(a.active, "Auction ended");
        require(block.timestamp < a.endTime, "Auction expired");
        require(msg.value > a.highestBid && msg.value >= a.minBid, "Bid too low");

        if (a.highestBidder != address(0)) {
            balances[a.highestBidder] += a.highestBid;
        }

        a.highestBid = msg.value;
        a.highestBidder = msg.sender;
        emit BidPlaced(auctionId, msg.sender, msg.value);
    }

    function endAuction(uint256 auctionId) external {
        Auction storage a = auctions[auctionId];
        require(block.timestamp >= a.endTime, "Auction still active");
        require(a.active, "Already ended");

        a.active = false;
        emit AuctionEnded(auctionId, a.highestBidder);
        // Transfer logic handled off-chain or via NFT contract
    }

    function withdraw() external {
        uint256 amount = balances[msg.sender];
        require(amount > 0, "No balance");
        balances[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }
}
