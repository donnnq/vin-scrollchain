// SPDX-License-Identifier: Scrollbound
pragma solidity ^0.8.0;

contract ScrollchainCompendium {
    string public keeper = "VINVIN";
    string public scrollverse = "vin-scrollchain";
    uint256 public totalScrolls;

    struct ScrollEntry {
        string name;
        string purpose;
        string soulTag;
        uint256 timestamp;
    }

    mapping(uint256 => ScrollEntry) public registry;

    event ScrollRegistered(string name, string soulTag, uint256 timestamp);

    function registerScroll(string memory name, string memory purpose, string memory soulTag) public {
        registry[totalScrolls] = ScrollEntry(name, purpose, soulTag, block.timestamp);
        emit ScrollRegistered(name, soulTag, block.timestamp);
        totalScrolls++;
    }

    function viewScroll(uint256 index) public view returns (string memory name, string memory purpose, string memory soulTag, uint256 timestamp) {
        ScrollEntry memory s = registry[index];
        return (s.name, s.purpose, s.soulTag, s.timestamp);
    }
}
