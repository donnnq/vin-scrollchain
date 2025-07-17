// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
 * @title vin-scrollMapIndex
 * @author VINVIN + Scrollkeeper
 * @notice Indexes symbolic scroll contracts, their category, owner, and timestamp
 */

contract vinScrollMapIndex {
    struct ScrollEntry {
        string title;
        string category;
        address contractAddress;
        address registrar;
        uint256 registeredAt;
    }

    event ScrollMapped(
        string title,
        string category,
        address indexed contractAddress,
        address indexed registrar,
        uint256 registeredAt
    );

    ScrollEntry[] public map;

    function registerScroll(string memory title, string memory category, address contractAddress) external {
        ScrollEntry memory entry = ScrollEntry({
            title: title,
            category: category,
            contractAddress: contractAddress,
            registrar: msg.sender,
            registeredAt: block.timestamp
        });

        map.push(entry);
        emit ScrollMapped(title, category, contractAddress, msg.sender, block.timestamp);
    }

    function viewScroll(uint index) external view returns (ScrollEntry memory) {
        require(index < map.length, "No scroll at that index");
        return map[index];
    }

    function totalScrollsIndexed() external view returns (uint256) {
        return map.length;
    }
}
