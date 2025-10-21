// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AnonymousTipProtectionProtocol {
    address public admin;

    struct TipEntry {
        string caseName;
        string tipType; // "Voice Message", "Text", "Email"
        string protectionLayer; // "Identity Shield", "Secure Routing", "Emotional Tagging"
        string emotionalTag;
        bool summoned;
        bool shielded;
        bool sealed;
    }

    TipEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTip(string memory caseName, string memory tipType, string memory protectionLayer, string memory emotionalTag) external onlyAdmin {
        entries.push(TipEntry(caseName, tipType, protectionLayer, emotionalTag, true, false, false));
    }

    function confirmShielding(uint256 index) external onlyAdmin {
        entries[index].shielded = true;
    }

    function sealTipEntry(uint256 index) external onlyAdmin {
        require(entries[index].shielded, "Must be shielded first");
        entries[index].sealed = true;
    }

    function getTipEntry(uint256 index) external view returns (TipEntry memory) {
        return entries[index];
    }
}
