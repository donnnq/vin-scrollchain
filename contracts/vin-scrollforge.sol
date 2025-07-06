// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract VinScrollforge is ERC1155, Ownable {
    uint256 public nextScrollId = 1;

    struct Scroll {
        string name;
        string meaning;
        bool soulbound;
    }

    mapping(uint256 => Scroll) public scrolls;

    event ScrollForged(uint256 indexed id, string name, string meaning, bool soulbound);
    event ScrollBestowed(address indexed to, uint256 indexed id, uint256 amount);

    constructor() ERC1155("https://vin-scrolls.io/api/scrolls/{id}.json") {}

    function forgeScroll(string calldata name, string calldata meaning, bool soulbound) external onlyOwner returns (uint256) {
        uint256 id = nextScrollId++;
        scrolls[id] = Scroll(name, meaning, soulbound);
        emit ScrollForged(id, name, meaning, soulbound);
        return id;
    }

    function bestowScroll(address to, uint256 id, uint256 amount) external onlyOwner {
        require(bytes(scrolls[id].name).length > 0, "Scroll does not exist");
        _mint(to, id, amount, "");
        emit ScrollBestowed(to, id, amount);
    }

    function isSoulbound(uint256 id) public view returns (bool) {
        return scrolls[id].soulbound;
    }

    function safeTransferFrom(address from, address to, uint256 id, uint256 amount, bytes memory data) public override {
        require(!isSoulbound(id), "This scroll is soulbound");
        super.safeTransferFrom(from, to, id, amount, data);
    }

    function uri(uint256 id) public view override returns (string memory) {
        return string(abi.encodePacked("https://vin-scrolls.io/api/scrolls/", _toString(id), ".json"));
    }

    function _toString(uint256 value) internal pure returns (string memory) {
        if (value == 0) return "0";
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) { digits++; temp /= 10; }
        bytes memory buffer = new bytes(digits);
        while (value != 0) { digits -= 1; buffer[digits] = bytes1(uint8(48 + uint256(value % 10))); value /= 10; }
        return string(buffer);
    }
}
