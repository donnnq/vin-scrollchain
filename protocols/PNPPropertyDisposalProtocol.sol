// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PNPPropertyDisposalProtocol {
    address public admin;

    struct PNPEntry {
        string itemName;
        string stationName;
        string disposalMethod;
        string emotionalTag;
        bool summoned;
        bool disposed;
        bool sealed;
    }

    PNPEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonPNPDisposal(string memory itemName, string memory stationName, string memory disposalMethod, string memory emotionalTag) external onlyAdmin {
        entries.push(PNPEntry(itemName, stationName, disposalMethod, emotionalTag, true, false, false));
    }

    function confirmDisposal(uint256 index) external onlyAdmin {
        entries[index].disposed = true;
    }

    function sealPNPEntry(uint256 index) external onlyAdmin {
        require(entries[index].disposed, "Must be disposed first");
        entries[index].sealed = true;
    }

    function getPNPEntry(uint256 index) external view returns (PNPEntry memory) {
        return entries[index];
    }
}
