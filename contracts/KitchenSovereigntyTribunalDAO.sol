// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KitchenSovereigntyTribunalDAO {
    address public admin;

    struct Tribunal {
        string kitchenName;
        string dispute;
        string verdict;
        bool resolved;
    }

    Tribunal[] public tribunals;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function fileTribunal(string memory _kitchenName, string memory _dispute, string memory _verdict) external onlyAdmin {
        tribunals.push(Tribunal(_kitchenName, _dispute, _verdict, false));
    }

    function resolveTribunal(uint256 index) external onlyAdmin {
        tribunals[index].resolved = true;
    }

    function getTribunal(uint256 index) external view returns (Tribunal memory) {
        return tribunals[index];
    }
}
