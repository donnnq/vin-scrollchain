// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CurrencyDiversificationCodexDAO {
    address public admin;

    struct DiversificationEntry {
        string country;
        string alternativeCurrency;
        string useCase;
        bool ratified;
    }

    DiversificationEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _country, string memory _alternativeCurrency, string memory _useCase) external onlyAdmin {
        codex.push(DiversificationEntry(_country, _alternativeCurrency, _useCase, false));
    }

    function ratifyEntry(uint256 index) external onlyAdmin {
        codex[index].ratified = true;
    }

    function getEntry(uint256 index) external view returns (DiversificationEntry memory) {
        return codex[index];
    }
}
