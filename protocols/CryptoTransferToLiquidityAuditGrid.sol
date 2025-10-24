// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CryptoTransferToLiquidityAuditGrid {
    address public steward;

    struct TransferEntry {
        string token; // "USDT", "Pi Network"
        string sourceWallet; // "Tether Treasury"
        string destinationWallet; // "Binance"
        string transferAmount; // "110M USD"
        string emotionalTag;
        bool audited;
        bool sealed;
    }

    TransferEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function auditTransfer(string memory token, string memory sourceWallet, string memory destinationWallet, string memory transferAmount, string memory emotionalTag) external onlySteward {
        entries.push(TransferEntry(token, sourceWallet, destinationWallet, transferAmount, emotionalTag, true, false));
    }

    function sealTransferEntry(uint256 index) external onlySteward {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getTransferEntry(uint256 index) external view returns (TransferEntry memory) {
        return entries[index];
    }
}
