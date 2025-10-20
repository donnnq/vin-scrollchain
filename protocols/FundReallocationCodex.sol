// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FundReallocationCodex {
    address public admin;

    struct ReallocationEntry {
        string originalProgram;
        string newBeneficiary;
        string reallocationClause;
        string emotionalTag;
        bool summoned;
        bool redirected;
        bool sealed;
    }

    ReallocationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReallocation(string memory originalProgram, string memory newBeneficiary, string memory reallocationClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ReallocationEntry(originalProgram, newBeneficiary, reallocationClause, emotionalTag, true, false, false));
    }

    function confirmRedirection(uint256 index) external onlyAdmin {
        entries[index].redirected = true;
    }

    function sealReallocationEntry(uint256 index) external onlyAdmin {
        require(entries[index].redirected, "Must be redirected first");
        entries[index].sealed = true;
    }

    function getReallocationEntry(uint256 index) external view returns (ReallocationEntry memory) {
        return entries[index];
    }
}
