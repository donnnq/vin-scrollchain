// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract VinScrollforgeV2 is ERC1155, Ownable {
    uint256 public nextScrollId = 1000;

    struct Scroll {
        string name;
        string meaning;
        bool soulbound;
    }

    mapping(uint256 => Scroll) public scrolls;

    event ScrollForged(uint256 indexed id, string name, string meaning, bool soulbound);
    event ScrollTransmuted(address indexed user, uint256[] ingredients, uint256 newScrollId);

    constructor() ERC1155("https://vin-scrolls.io/api/v2/{id}.json") {}

    function forgeScroll(string calldata name, string calldata meaning, bool soulbound) external onlyOwner returns (uint256) {
        uint256 id = nextScrollId++;
        scrolls[id] = Scroll(name, meaning, soulbound);
        emit ScrollForged(id, name, meaning, soulbound);
        return id;
    }

    function transmuteScrolls(uint256[] calldata ingredientIds, uint256[] calldata amounts, string calldata name, string calldata meaning, bool soulbound) external {
        require(ingredientIds.length == amounts.length, "Mismatched input");

        // Burn ingredients
        for (uint256 i = 0; i < ingredientIds.length; i++) {
            require(balanceOf(msg.sender, ingredientIds[i]) >= amounts[i], "Insufficient scrolls");
            _burn(msg.sender, ingredientIds[i], amounts[i]);
        }

        // Forge new scroll
        uint256 newId = nextScrollId++;
        scrolls[newId] = Scroll(name, meaning, soulbound);
        _mint(msg.sender, newId, 1, "");

        emit ScrollForged(newId, name, meaning, soulbound);
        emit ScrollTransmuted(msg.sender, ingredientIds, newId);
    }

    function isSoulbound(uint256 id) public view returns (bool) {
        return scrolls[id].soulbound;
    }

    function safeTransferFrom(address from, address to, uint256 id, uint256 amount, bytes memory data) public override {
        require(!isSoulbound(id), "This scroll is soulbound");
        super.safeTransferFrom(from, to, id, amount, data);
    }
}
