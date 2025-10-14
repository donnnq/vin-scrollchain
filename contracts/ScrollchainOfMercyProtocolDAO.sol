// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollchainOfMercyProtocolDAO {
    address public admin;

    struct MercyScroll {
        string actOfKindness;
        string corridor;
        string emotionalTag;
        bool archived;
    }

    MercyScroll[] public scrolls;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitScroll(string memory _actOfKindness, string memory _corridor, string memory _emotionalTag) external onlyAdmin {
        scrolls.push(MercyScroll(_actOfKindness, _corridor, _emotionalTag, false));
    }

    function archiveScroll(uint256 index) external onlyAdmin {
        scrolls[index].archived = true;
    }

    function getScroll(uint256 index) external view returns (MercyScroll memory) {
        return scrolls[index];
    }
}
