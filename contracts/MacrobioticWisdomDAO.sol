// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MacrobioticWisdomDAO {
    address public admin;

    struct WisdomEntry {
        string principle;
        string origin;
        string application;
        bool verified;
    }

    WisdomEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitWisdom(string memory _principle, string memory _origin, string memory _application) external onlyAdmin {
        entries.push(WisdomEntry(_principle, _origin, _application, true));
    }

    function getWisdom(uint256 index) external view returns (WisdomEntry memory) {
        return entries[index];
    }
}
