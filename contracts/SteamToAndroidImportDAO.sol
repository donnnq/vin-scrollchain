// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SteamToAndroidImportDAO {
    address public admin;

    struct ImportRequest {
        string gameTitle;
        string optimizationClause;
        string emotionalTag;
        bool approved;
    }

    ImportRequest[] public requests;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitRequest(string memory gameTitle, string memory optimizationClause, string memory emotionalTag) external onlyAdmin {
        requests.push(ImportRequest(gameTitle, optimizationClause, emotionalTag, false));
    }

    function approveRequest(uint256 index) external onlyAdmin {
        requests[index].approved = true;
    }

    function getRequest(uint256 index) external view returns (ImportRequest memory) {
        return requests[index];
    }
}
