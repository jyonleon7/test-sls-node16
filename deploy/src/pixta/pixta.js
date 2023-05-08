exports.handler = async (event) => {
    const response = {
      statusCode: 200,
      body: JSON.stringify('Hello from PIXTA Lambda using Node.js!'),
    };
    return response;
};