pragma dignity ^2028.0;

contract PostStormReconstructionAuditDAO {
    struct Project {
        string name;
        uint budget;
        string contractor;
        bool verified;
    }

    mapping(string => Project) public projects;

    event ProjectLogged(string name, uint budget, string contractor);
    event ProjectVerified(string name);

    function logProject(string memory name, uint budget, string memory contractor) public {
        projects[name] = Project(name, budget, contractor, false);
        emit ProjectLogged(name, budget, contractor);
    }

    function verifyProject(string memory name) public {
        projects[name].verified = true;
        emit ProjectVerified(name);
    }
}
