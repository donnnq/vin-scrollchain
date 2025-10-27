// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract QRMenuToMultilingualAccessGrid {
    address public steward;

    struct MenuEntry {
        string booth; // "Fishball Queen, Lumpia Legend"
        string clause; // "Scrollchain-sealed grid for multilingual QR menus, diaspora access, and tech dignity"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    MenuEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexMenu(string memory booth, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(MenuEntry(booth, clause, emotionalTag, true, false));
    }

    function sealMenuEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getMenuEntry(uint256 index) external view returns (MenuEntry memory) {
        return entries[index];
    }
}
