// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CambodiaScamNetworkIndex {
    address public admin;

    struct NetworkEntry {
        string syndicateName;
        string region; // "Sihanoukville", "Phnom Penh", etc.
        string operationLayer; // "Pig Butchering", "Crypto Laundering", "Human Trafficking"
        string emotionalTag;
        bool summoned;
        bool indexed;
        bool sealed;
    }

    NetworkEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonNetwork(string memory syndicateName, string memory region, string memory operationLayer, string memory emotionalTag) external onlyAdmin {
        entries.push(NetworkEntry(syndicateName, region, operationLayer, emotionalTag, true, false, false));
    }

    function confirmIndexing(uint256 index) external onlyAdmin {
        entries[index].indexed = true;
    }

    function sealNetworkEntry(uint256 index) external onlyAdmin {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getNetworkEntry(uint256 index) external view returns (NetworkEntry memory) {
        return entries[index];
    }
}
