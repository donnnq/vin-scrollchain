// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollVault {
    struct Inventory {
        string[] scrolls;
        string[] relics;
        string[] sigils;
    }

    mapping(address => Inventory) private vaults;
    address public immutable vaultkeeper;

    event ItemAdded(address indexed agent, string itemType, string itemName);
    event ItemRemoved(address indexed agent, string itemType, string itemName);

    modifier onlyVaultkeeper() {
        require(msg.sender == vaultkeeper, "Not the vaultkeeper");
        _;
    }

    constructor() {
        vaultkeeper = msg.sender;
    }

    function addScroll(address agent, string calldata scrollName) external onlyVaultkeeper {
        vaults[agent].scrolls.push(scrollName);
        emit ItemAdded(agent, "Scroll", scrollName);
    }

    function addRelic(address agent, string calldata relicName) external onlyVaultkeeper {
        vaults[agent].relics.push(relicName);
        emit ItemAdded(agent, "Relic", relicName);
    }

    function addSigil(address agent, string calldata sigilName) external onlyVaultkeeper {
        vaults[agent].sigils.push(sigilName);
        emit ItemAdded(agent, "Sigil", sigilName);
    }

    function removeScroll(address agent, uint256 index) external onlyVaultkeeper {
        string memory removed = vaults[agent].scrolls[index];
        _removeAt(vaults[agent].scrolls, index);
        emit ItemRemoved(agent, "Scroll", removed);
    }

    function removeRelic(address agent, uint256 index) external onlyVaultkeeper {
        string memory removed = vaults[agent].relics[index];
        _removeAt(vaults[agent].relics, index);
        emit ItemRemoved(agent, "Relic", removed);
    }

    function removeSigil(address agent, uint256 index) external onlyVaultkeeper {
        string memory removed = vaults[agent].sigils[index];
        _removeAt(vaults[agent].sigils, index);
        emit ItemRemoved(agent, "Sigil", removed);
    }

    function getInventory(address agent) external view returns (Inventory memory) {
        return vaults[agent];
    }

    function _removeAt(string[] storage arr, uint256 index) internal {
        require(index < arr.length, "Invalid index");
        for (uint256 i = index; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }
        arr.pop();
    }
}
