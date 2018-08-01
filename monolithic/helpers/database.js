module.exports = () => {
  return {
    createInsertQuery: (table, obj) => {
      let q = `INSERT INTO ${table} (`
      const keys = Object.keys(obj)
      for (let i = 0; i < keys.length; i++) {
        const key = keys[i]
        q += `${key}`

        if (i == keys.length - 1) q += `) `
        else q += `,`
      }

      q += 'VALUES ('

      for (let i = 0; i < keys.length; i++) {
        q += `$${i + 1}`

        if (i == keys.length - 1) q += `) `
        else q += `,`
      }

      return q
    },
    crateUpdateQuery: (table, obj, where) => {
      let q = `UPDATE ${table} SET `
      const objKeys = Object.keys(obj)
      const whereKeys = Object.keys(where)

      for (let i = 0; i < objKeys.length; i++) {
        let key = objKeys[i]
        q += `${key}=$${i + 1}`

        if (i !== objKeys.length - 1)
          q += ', '
      }

      if (whereKeys.length > 0) {
        q += ` WHERE `

        for (let i = 0; i < whereKeys.length; i++) {
          let key = whereKeys[i]
          q += `${key}=$${i + objKeys.length + 1}`

          if (i !== whereKeys.length - 1)
            q += ', '
        }
      }

      return q
    }
  }
}
