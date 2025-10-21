// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StablecoinMintingErrorDAO {
    address public admin;

    struct MintingError {
        string token;
        uint256 mintedAmount;
        string errorType; // "Fat Finger", "Decimal Misplacement", "Contract Glitch"
        string emotionalTag;
        bool summoned;
        bool reversed;
        bool sealed;
    }

    MintingError[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonError(string memory token, uint256 mintedAmount, string memory errorType, string memory emotionalTag) external onlyAdmin {
        entries.push(MintingError(token, mintedAmount, errorType, emotionalTag, true, false, false));
    }

    function confirmReversal(uint256 index) external onlyAdmin {
        entries[index].reversed = true;
    }

    function sealErrorEntry(uint256 index) external onlyAdmin {
        require(entries[index].reversed, "Must be reversed first");
        entries[index].sealed = true;
    }

    function getErrorEntry(uint256 index) external view returns (MintingError memory) {
        return entries[index];
    }
}
