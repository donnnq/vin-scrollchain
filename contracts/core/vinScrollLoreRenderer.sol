// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinScrollLoreRenderer {
    event LoreGenerated(string scrollName, string lore);

    function generateLore(string memory scrollName) public {
        string memory lore = string(abi.encodePacked("The scroll of ", scrollName, " was forged in the fires of civic duty and sealed with honor."));
        emit LoreGenerated(scrollName, lore);
    }
}
