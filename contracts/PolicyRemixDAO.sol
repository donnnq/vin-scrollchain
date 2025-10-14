// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PolicyRemixDAO {
    address public admin;

    struct Remix {
        string originalPolicy;
        string remixTheme;
        string proposedChange;
        bool ratified;
    }

    Remix[] public remixes;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function proposeRemix(string memory _originalPolicy, string memory _remixTheme, string memory _proposedChange) external onlyAdmin {
        remixes.push(Remix(_originalPolicy, _remixTheme, _proposedChange, false));
    }

    function ratifyRemix(uint256 index) external onlyAdmin {
        remixes[index].ratified = true;
    }

    function getRemix(uint256 index) external view returns (Remix memory) {
        return remixes[index];
    }
}
