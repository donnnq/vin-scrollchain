// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BallotChainSovereigntyProtocol {
    address public admin;

    struct BallotEntry {
        string precinctID;
        string custodyStatus;
        string tamperFlag;
        string emotionalTag;
        bool summoned;
        bool protected;
        bool sealed;
    }

    BallotEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonBallotChain(string memory precinctID, string memory custodyStatus, string memory tamperFlag, string memory emotionalTag) external onlyAdmin {
        entries.push(BallotEntry(precinctID, custodyStatus, tamperFlag, emotionalTag, true, false, false));
    }

    function confirmProtection(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealBallotChain(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getBallotEntry(uint256 index) external view returns (BallotEntry memory) {
        return entries[index];
    }
}
