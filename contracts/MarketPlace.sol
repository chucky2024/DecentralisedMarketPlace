// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract JobMarketplace {
    struct Job {
        string description;
        address employer;
        bool filled;
        address applicant;
    }

    mapping(bytes32 => Job) public jobs;

    event JobPosted(bytes32 indexed jobId, string description, address indexed employer);
    event JobFilled(bytes32 indexed jobId, address indexed applicant);

    function postJob(bytes32 jobId, string memory description) public {
        jobs[jobId] = Job(description, msg.sender, false, address(0));
        emit JobPosted(jobId, description, msg.sender);
    }

    function applyForJob(bytes32 jobId) public {
        Job storage job = jobs[jobId];
        require(!job.filled, "Job already filled");
        job.filled = true;
        job.applicant = msg.sender;
        emit JobFilled(jobId, msg.sender);
    }

    function getJob(bytes32 jobId) public view returns (string memory, address, bool, address) {
        Job memory job = jobs[jobId];
        return (job.description, job.employer, job.filled, job.applicant);
    }
}

