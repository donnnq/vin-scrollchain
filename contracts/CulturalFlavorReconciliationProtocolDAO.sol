// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CulturalFlavorReconciliationProtocolDAO {
    address public admin;

    struct Reconciliation {
        string dish;
        string disputedOrigin;
        string resolutionMethod;
        bool reconciled;
    }

    Reconciliation[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function fileProtocol(string memory _dish, string memory _disputedOrigin, string memory _resolutionMethod) external onlyAdmin {
        protocols.push(Reconciliation(_dish, _disputedOrigin, _resolutionMethod, false));
    }

    function markReconciled(uint256 index) external onlyAdmin {
        protocols[index].reconciled = true;
    }

    function getProtocol(uint256 index) external view returns (Reconciliation memory) {
        return protocols[index];
    }
}
