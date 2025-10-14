// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayLiquidityDAO {
    address public admin;

    struct LiquidityPool {
        string barangay;
        string fundingSource;
        string reinvestmentPath;
        uint256 poolSize;
        bool active;
    }

    LiquidityPool[] public pools;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function createPool(string memory _barangay, string memory _fundingSource, string memory _reinvestmentPath, uint256 _poolSize) external onlyAdmin {
        pools.push(LiquidityPool(_barangay, _fundingSource, _reinvestmentPath, _poolSize, true));
    }

    function deactivatePool(uint256 index) external onlyAdmin {
        pools[index].active = false;
    }

    function getPool(uint256 index) external view returns (LiquidityPool memory) {
        return pools[index];
    }
}
