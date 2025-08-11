// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title GlobalDeployer - Tracks global tech entities and their local deployments
contract GlobalDeployer {

    struct Deployer {
        string name;
        string originCountry;
        string localOffice;
        string[] deployedModules;
        string impactSummary;
        bool active;
        uint256 deployedAt;
    }

    mapping(address => Deployer) public deployers;
    address[] public registeredDeployers;

    event DeployerRegistered(address indexed agent, string name, string localOffice);
    event ModuleAdded(address indexed agent, string moduleName);
    event DeployerDeactivated(address indexed agent, string name);

    /// @notice Register a global deployer
    function registerDeployer(
        string memory _name,
        string memory _originCountry,
        string memory _localOffice,
        string memory _impactSummary
    ) public {
        Deployer memory newDeployer = Deployer({
            name: _name,
            originCountry: _originCountry,
            localOffice: _localOffice,
            deployedModules: new string[](0),
            impactSummary: _impactSummary,
            active: true,
            deployedAt: block.timestamp
        });

        deployers[msg.sender] = newDeployer;
        registeredDeployers.push(msg.sender);

        emit DeployerRegistered(msg.sender, _name, _localOffice);
    }

    /// @notice Add a deployed module to a deployer
    function addModule(string memory _moduleName) public {
        require(deployers[msg.sender].active, "Deployer not active.");
        deployers[msg.sender].deployedModules.push(_moduleName);

        emit ModuleAdded(msg.sender, _moduleName);
    }

    /// @notice Deactivate a deployer
    function deactivateDeployer() public {
        require(deployers[msg.sender].active, "Deployer already inactive.");
        deployers[msg.sender].active = false;

        emit DeployerDeactivated(msg.sender, deployers[msg.sender].name);
    }

    /// @notice Get all registered deployers
    function getRegisteredDeployers() public view returns (address[] memory) {
        return registeredDeployers;
    }

    /// @notice Get deployer details
    function getDeployer(address _agent) public view returns (Deployer memory) {
        return deployers[_agent];
    }
}
