pragma solidity ^0.8.0;

contract GazaAidScroll {
    event AidDeployed(string region, string supplyType, uint256 quantity);
    event SupplyRestocked(string supplyType, uint256 quantity);
    event GuardianAcknowledged(address indexed guardian, string message);

    mapping(string => uint256) public supplyVault;

    modifier onlyGuardian() {
        require(msg.sender != address(0), "Ghost addresses not allowed.");
        _;
    }

    function deploy(string memory region, string memory supplyType, uint256 quantity) public onlyGuardian {
        require(supplyVault[supplyType] >= quantity, "Not enough stock.");
        supplyVault[supplyType] -= quantity;
        emit AidDeployed(region, supplyType, quantity);
    }

    function restock(string memory supplyType, uint256 quantity) public onlyGuardian {
        supplyVault[supplyType] += quantity;
        emit SupplyRestocked(supplyType, quantity);
    }

    function acknowledgeGuardian(address guardian, string memory message) public {
        emit GuardianAcknowledged(guardian, message);
    }
}
