// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OLearyMemeTribunalDAO {
    address public admin;

    struct MemeCase {
        string quote;
        string context;
        string memeVerdict;
        bool immortalized;
    }

    MemeCase[] public memes;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitMeme(string memory _quote, string memory _context, string memory _memeVerdict) external onlyAdmin {
        memes.push(MemeCase(_quote, _context, _memeVerdict, false));
    }

    function immortalizeMeme(uint256 index) external onlyAdmin {
        memes[index].immortalized = true;
    }

    function getMeme(uint256 index) external view returns (MemeCase memory) {
        return memes[index];
    }
}
