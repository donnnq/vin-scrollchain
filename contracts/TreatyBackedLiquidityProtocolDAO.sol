// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyBackedLiquidityProtocolDAO {
    address public admin;

    struct LiquidityTreaty {
        string treatyName;
        string liquiditySource;
        string corridorActivated;
        uint256 poolSize;
        bool deployed;
    }

    LiquidityTreaty[] public treaties;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitTreaty(string memory _treatyName, string memory _liquiditySource, string memory _corridorActivated, uint256 _poolSize) external onlyAdmin {
        treaties.push(LiquidityTreaty(_treatyName, _liquiditySource, _corridorActivated, _poolSize, false));
    }

    function deployTreaty(uint256 index) external onlyAdmin {
        treaties[index].deployed = true;
    }

    function getTreaty(uint256 index) external view returns (LiquidityTreaty memory) {
        return treaties[index];
    }
}
