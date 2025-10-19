// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MobilityJusticeMuralProtocol {
    address public admin;

    struct MuralEntry {
        string location;
        string theme;
        string emotionalTag;
        bool summoned;
        bool painted;
        bool sealed;
    }

    MuralEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonMural(string memory location, string memory theme, string memory emotionalTag) external onlyAdmin {
        entries.push(MuralEntry(location, theme, emotionalTag, true, false, false));
    }

    function confirmPainting(uint256 index) external onlyAdmin {
        entries[index].painted = true;
    }

    function sealMural(uint256 index) external onlyAdmin {
        require(entries[index].painted, "Must be painted first");
        entries[index].sealed = true;
    }

    function getMuralEntry(uint256 index) external view returns (MuralEntry memory) {
        return entries[index];
    }
}
